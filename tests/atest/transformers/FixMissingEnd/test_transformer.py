import pytest

from .. import run_tidy_and_compare, run_tidy


class TestFixMissingEnd:
    TRANSFORMER_NAME = 'FixMissingEnd'

    def test_merging_and_ordering(self):
        run_tidy_and_compare(self.TRANSFORMER_NAME, source='test.robot')
