.PHONY: all clean git FORCE

TEX_FILES = $(wildcard *.tex)
PDF_FILES = $(TEX_FILES:.tex=.pdf)
ALL_FILES = $(patsubst %.tex, %, $(TEX_FILES))

all : $(ALL_FILES)

%: %.tex
	latexmk -pdf --output-directory=build $@.tex; \
	cp build/$@.pdf $@.pdf;


%.pdf: %.tex FORCE
	latexmk -pdf -pvc --output-directory=build $<; cp build/$@ $@;

FORCE:
	
clean :
	rm -r build $(PDF_FILES)

git:
	git add .
	git commit -m "$m"
	git push -u https://github.com/iagopinal/phd_bioinformatics master