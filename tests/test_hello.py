import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from hello import main


def test_main_outputs_hello(capsys):
    main()
    captured = capsys.readouterr()
    assert "Hello, world!" in captured.out
