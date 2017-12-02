from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, HasSelection
from prompt_toolkit.keys import Keys


def just_execute(event):
    cbuffer = event.current_buffer
    if cbuffer.complete_state:
        state = cbuffer.complete_state
        completion = state.current_completion
        if completion:
            cbuffer.apply_completion(completion)
        else:
            cbuffer.cancel_completion()
        return
    action = cbuffer.accept_action
    action.validate_and_handle(event.cli, cbuffer)


ip, key = get_ipython(), Keys.ControlJ
focus, select = HasFocus(DEFAULT_BUFFER), HasSelection()
registry = ip.pt_cli.application.key_bindings_registry
binding = registry.add_binding(key, filter=(focus & ~select))
binding(just_execute)
