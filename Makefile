
all: pdf

pdf: exam_preparation.md
	pandoc exam_preparation.md -o exam_preparation.pdf