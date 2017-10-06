NB_PORT=10020
nvidia-docker run -it --rm \
    --user=$UID:$UID \
    -p $NB_PORT:$NB_PORT \
    -v `pwd`/notebooks:/notebooks \
    phizaz/tensorflow:keras-gpu \
    jupyter notebook --ip="*" --port=$NB_PORT
