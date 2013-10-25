# You may override this variable from the command line. E.g.:
# make TARGET=foo
# make clean TARGET=foo
#TARGET = skeleton-thesis

.PHONY : clean all

all : $(patsubst %,%.pdf,main)
#all : skeleton-thesis
clean :
	- rm -f main.aux main.log main.bbl main.blg main.bcf main.out main.run.xml main.pdf main.lot main.lof main.toc

#	- rm -f $(patsubst %,%.aux,$(TARGET)) $(patsubst %,%.log,$(TARGET)) $(patsubst %,%.bbl,$(TARGET)) $(patsubst %,%.blg,$(TARGET)) $(patsubst %,%.bcf,$(TARGET)) $(patsubst %,%.out,$(TARGET)) $(patsubst %,%.run.xml,$(TARGET)) $(patsubst %,%.pdf,$(TARGET)) *~

# You may append other dependencies
%.pdf : %.tex %.bib
	basename=$(shell basename $< .tex); \
	xelatex $$basename; \
	biber $$basename; \
	xelatex $$basename; xelatex $$basename
