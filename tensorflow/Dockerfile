FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get update
RUN apt-get install -y git

RUN pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user

# install VIM binding for Jupyter
RUN     mkdir -p $(jupyter --data-dir)/nbextensions \
        && cd $(jupyter --data-dir)/nbextensions \
        && git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding \
        && chmod -R go-w vim_binding
# activate VIM binding for Jupyter
RUN jupyter nbextension enable vim_binding/vim_binding

# activate drag and drop in the notebook
RUN jupyter nbextension enable dragdrop/main

# activate auto-save time
RUN jupyter nbextension enable autosavetime/main

# activate hinterland
RUN jupyter nbextension enable hinterland/hinterland

# activate code prettify
RUN pip install yapf
RUN jupyter nbextension enable code_prettify/code_prettify
