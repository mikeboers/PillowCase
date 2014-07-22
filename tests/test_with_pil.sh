#!/bin/bash

#!/bin/bash
#!/bin/bash

self="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
. "$self/setup.sh"

clean_venv clean
source $VENV/bin/activate

get_pil
pip install "$PIL"

pip install "$self/.."

pip freeze | grep -qi pillowcase== || error missing pillowcase
pip freeze | grep -qi pillow== && error pillow was installed
pip freeze | grep -qi pil== || error missing pil stub

python -c 'import PIL; assert not hasattr(PIL, "PILLOW_VERSION")' || error python imported pillow
