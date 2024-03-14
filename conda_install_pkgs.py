import conda.cli
conda.cli.main("create", "--name", "bacarena_env")
conda.cli.main("install", "-c", "conda-forge", "-y", "r-sybil")
conda.cli.main("install", "-c", "conda-forge", "-y", "r-glpkAPI")
conda.cli.main("install", "-c", "bioconda", "-y", "libsbml")
conda.cli.main("install", "-y", "pandas")
