TARGET = thesis
SLIDES = slides
TEX = pdflatex
BIBER = biber

CLEXT ?= *.aux *.toc *.idx *.ind *.ilg *.log *.out *.lof *.lot *.lol \
  *.bbl *.bcf *.blg *.bak *.dvi *.run.xml *.ps *.pdf *.synctex *.synctex.gz

all : thesis slides

thesis : $(TARGET).pdf

slides : $(SLIDES).pdf

install : all

clean :
	-rm -f $(CLEXT)

nobib : $(TARGET).tex tex/*.tex *.sty *.bib
	$(TEX) $(TARGET).tex
	$(TEX) $(TARGET).tex

$(TARGET).pdf : $(TARGET).tex tex/*.tex *.sty *.bib
	$(TEX) $(TARGET).tex
	$(BIBER) $(TARGET).bcf
	$(TEX) $(TARGET).tex
	$(TEX) $(TARGET).tex

$(SLIDES).pdf : $(SLIDES).tex *.sty
	$(TEX) $(SLIDES).tex
	$(TEX) $(SLIDES).tex
