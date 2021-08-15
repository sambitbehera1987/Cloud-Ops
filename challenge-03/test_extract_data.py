import extract_data
import unittest


class TestExtract(unittest.TestCase):

    def test_extract1(self):
        result = extract_data.extract({'x': {'y': {'z': 'a'}}}, 'x/y/z')
        self.assertEqual(result, 'a')

    def test_extract2(self):
        result = extract_data.extract({'x': {'y': {'z': 'a'}}}, 'x/y')
        self.assertEqual(result, {'z': 'a'})

    def test_extract3(self):
        result = extract_data.extract({'x': {'y': {'z': 'a'}}}, 'y/z/x')
        self.assertIsNone(result)

    def test_extract4(self):
        result = extract_data.extract({'x': {'y': {'z': 'a'}}, 'm': ['1', '2', '3']}, 'm')
        self.assertEqual(result, ['1', '2', '3'])


if __name__ == '__main__':
    unittest.main()

