#!/bin/bash

#!/bin/bash
#!/bin/bash

self="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
. "$self/setup.sh"

clean_venv clean
source $VENV/bin/activate

get_pillow
pip install "$PILLOW"

pip install "$self/.."

pip freeze | grep -qi pillowcase== || error missing pillowcase
pip freeze | grep -qi pillow== || error missing pillow
pip freeze | grep -qi pil== || error missing pil stub

python -c 'import PIL; assert hasattr(PIL, "PILLOW_VERSION")' || error python imported pil
