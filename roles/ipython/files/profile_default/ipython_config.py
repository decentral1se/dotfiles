import os
import warnings

import IPython
from IPython.terminal.prompts import Prompts, Token

warnings.filterwarnings('ignore')

## lines of code to run at IPython startup.
c.InteractiveShellApp.exec_lines = [
    "%autoreload 2"
]

## A list of dotted module names of IPython extensions to load.
c.InteractiveShellApp.extensions = [
    "autoreload"
]

## The IPython profile to use.
c.BaseIPythonApplication.profile = 'lwm'

## Whether to display a banner upon starting IPython.
c.TerminalIPythonApp.display_banner = False

## If a command or file is given via the command-line, e.g. 'ipython foo.py',
#  start an interactive shell after executing the file or command.
c.TerminalIPythonApp.force_interact = True

## Start IPython quickly by skipping the loading of config files.
c.TerminalIPythonApp.quick = False

## Autoindent IPython code entered interactively.
c.InteractiveShell.autoindent = True

## Enable magic commands to be called without the leading %.
c.InteractiveShell.automagic = True

## The part of the banner to be printed before the profile
pyversion = "Python: {}".format(IPython.sys.version.split()[0])
ipyversion = "IPython: {}".format(".".join([str(x) for x in IPython.version_info if x is not ""]))
banner = "{} :: {}".format(pyversion, ipyversion)
c.InteractiveShell.banner1 = banner

## The part of the banner to be printed after the profile
c.InteractiveShell.banner2 = ""

## Set the color scheme (NoColor, Neutral, Linux, or LightBG).
c.InteractiveShell.colors = 'Linux'

## Total length of command history
c.InteractiveShell.history_length = 10000

## The number of saved history entries to be loaded into the history buffer at
#  startup.
c.InteractiveShell.history_load_length = 1000

## Prompt seperators
c.InteractiveShell.separate_in = ''
c.InteractiveShell.separate_out = ''
c.InteractiveShell.separate_out2 = ''

## Set to confirm when you try to exit IPython with an EOF (Control-D in Unix,
#  Control-Z/Enter in Windows). By typing 'exit' or 'quit', you can force a
#  direct exit without any confirmation.
c.TerminalInteractiveShell.confirm_exit = False

## Options for displaying tab completions, 'column', 'multicolumn', and
#  'readlinelike'. These options are for `prompt_toolkit`, see `prompt_toolkit`
#  documentation for more information.
c.TerminalInteractiveShell.display_completions = 'multicolumn'

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = 'nvim'

## Enable vi (v) or Emacs (C-X C-E) shortcuts to open an external editor. This is
#  in addition to the F2 binding, which is always enabled.
c.TerminalInteractiveShell.extra_open_editor_shortcuts = True

## Highlight matching brackets.
c.TerminalInteractiveShell.highlight_matching_brackets = True

class MyPrompt(Prompts):
     def in_prompt_tokens(self, cli=None):
         return [(Token.Prompt, ">>> ")]
     def continuation_prompt_tokens(self, cli=None, width=None):
         return [(Token.Prompt, '... ')]
     def rewrite_prompt_tokens(self):
         return []
     def out_prompt_tokens(self):
         return []

## Class used to generate Prompt token for prompt_toolkit
c.TerminalInteractiveShell.prompts_class = MyPrompt

## Automatically set the terminal title
c.TerminalInteractiveShell.term_title = False

## Instruct the completer to omit private method names
#
#  Specifically, when completing on ``object.<tab>``.
#
#  When 2 [default]: all names that start with '_' will be excluded.
#
#  When 1: all 'magic' names (``__foo__``) will be excluded.
#
#  When 0: nothing will be excluded.
c.IPCompleter.omit__names = 1

## If True, any %store-d variables will be automatically restored when IPython
#  starts.
c.StoreMagics.autorestore = True
