export CONDA_ENVIRONMENT := "tf1-env"

create-environment:
	conda env create --file environment.yml

update-environment:
	conda env update --file environment.yml --prune