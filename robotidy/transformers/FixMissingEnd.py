from robot.api.parsing import (
    ModelTransformer,
    End,
    Token,
    EmptyLine,
    Comment,
    CommentSection
)
from robotidy.decorators import check_start_end_line


class FixMissingEnd(ModelTransformer):
    """
    Fix parsing errors.

    Fix parsing errors like missing END in FOR loop or IF block or not capitalized reserved words.
    Deprecated syntax (like # TODO
    """
    def __init__(self):
        self.empty_lines = []

    def visit_File(self, node):  # noqa
        self.empty_lines = []
        return self.generic_visit(node)

    def visit_For(self, node):
        empty_lines = []
        node.header.data_tokens[0].value = 'FOR'
        indent = node.header.tokens[0] if node.header.tokens[0].type == Token.SEPARATOR else \
            Token(Token.SEPARATOR, ' ' * self.formatting_config.space_count)
        if node.end:
            node.end.data_tokens[0].value = 'END'
        else:
            empty_lines = self.get_trailing_empty_lines(node)
            if node.body:
                if hasattr(node.body[-1], 'header'):
                    node.body[-1].header.tokens = node.body[-1].header.tokens[:-1] + (Token(Token.EOL, '\n'),)
                else:
                    node.body[-1].tokens = node.body[-1].tokens[:-1] + (Token(Token.EOL, '\n'),)
            node.end = End([indent, Token(Token.END), Token(Token.EOL, '\n')])
        return self.generic_visit(node), *empty_lines

    def visit_If(self, node):
        empty_lines = []
        node.header.data_tokens[0].value = node.header.data_tokens[0].type
        indent = node.header.tokens[0] if node.header.tokens[0].type == Token.SEPARATOR else \
            Token(Token.SEPARATOR, ' ' * self.formatting_config.space_count)
        if node.end:
            node.end.data_tokens[0].value = 'END'
        elif not node.orelse:
            empty_lines = self.get_trailing_empty_lines(node)
            if node.body:
                if hasattr(node.body[-1], 'header'):
                    node.body[-1].header.tokens = node.body[-1].header.tokens[:-1] + (Token(Token.EOL, '\n'),)
                else:
                    node.body[-1].tokens = node.body[-1].tokens[:-1] + (Token(Token.EOL, '\n'),)
            node.end = End([indent, Token(Token.END), Token(Token.EOL, '\n')])
        return self.generic_visit(node), *empty_lines

    @staticmethod
    def get_trailing_empty_lines(node):
        lines = []
        while node and node.body and isinstance(node.body[-1], EmptyLine):
            lines.append(node.body.pop())
        return lines
