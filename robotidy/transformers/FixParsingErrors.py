from robot.api.parsing import (
    ModelTransformer,
    End,
    Token,
    EmptyLine,
    Comment,
    CommentSection
)
from robotidy.decorators import check_start_end_line


class FixParsingErrors(ModelTransformer):
    """
    Fix parsing errors.

    Fix parsing errors like missing END in FOR loop or IF block or not capitalized reserved words.
    Deprecated syntax (like # TODO
    """
    def visit_For(self, node):
        empty_lines = []
        node.header.data_tokens[0].value = 'FOR'
        indent = node.header.tokens[0] if node.header.tokens[0].type == Token.SEPARATOR else \
            Token(Token.SEPARATOR, ' ' * self.formatting_config.space_count)
        if node.end:
            node.end.data_tokens[0].value = 'END'
        else:
            empty_lines = self.get_trailing_empty_lines(node)
            node.end = End([indent, Token(Token.END), Token(Token.EOL, '\n')])
        node = self.generic_visit(node)
        return node, *empty_lines

    def visit_If(self, node):
        empty_lines = []
        node.header.data_tokens[0].value = 'IF'
        node.body = [self.visit(item) for item in node.body]
        indent = node.header.tokens[0] if node.header.tokens[0].type == Token.SEPARATOR else \
            Token(Token.SEPARATOR, ' ' * self.formatting_config.space_count)
        if node.end:
            node.end.data_tokens[0].value = 'END'
        elif not node.orelse:
            empty_lines = self.get_trailing_empty_lines(node)
            node.end = End([indent, Token(Token.END), Token(Token.EOL, '\n')])
        else:
            self.visit(node.orelse)
        return node, *empty_lines

    @staticmethod
    def get_trailing_empty_lines(node):
        lines = []
        while node and node.body and isinstance(node.body[-1], EmptyLine):
            lines.append(node.body.pop())
        return lines
