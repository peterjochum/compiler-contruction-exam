
all: pdf

pdf: exam_preparation.md
	pandoc README.md -o README.pdf
