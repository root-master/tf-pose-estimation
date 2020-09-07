export CONDA_ENVIRONMENT := "tf1-env"

create-environment:
	conda env create --file environment.yml

update-environment:
	conda env update --file environment.yml --prune

install:
	source $$(conda info --base)/etc/profile.d/conda.sh && \
	conda activate $(CONDA_ENVIRONMENT) && \
	python setup.py install && \
	cd tf_pose/pafprocess && \
	swig -python -c++ pafprocess.i && \
	python3 setup.py build_ext --inplace

webcam-demo:
	conda activate $(CONDA_ENVIRONMENT) && \
	python run_webcam.py --model=mobilenet_thin --resize=432x368 --camera=0

image-demo:
	conda activate $(CONDA_ENVIRONMENT) && \
	python run.py --model=mobilenet_thin --resize=432x368 --image=./images/p1.jpg
