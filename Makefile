TARGET = thesis
TEX = pdflatex
BIBER = biber

CLEXT ?= *.aux *.toc *.idx *.ind *.ilg *.log *.out *.lof *.lot *.lol \
  *.bbl *.bcf *.blg *.bak *.dvi *.run.xml *.ps *.pdf *.synctex *.synctex.gz

all : $(TARGET).pdf

install : all

clean :
	-rm -f $(CLEXT)

$(TARGET).pdf : $(TARGET).tex tex/*.tex *.sty *.bib
	$(TEX) $(TARGET).tex
	$(BIBER) $(TARGET).bcf
	$(TEX) $(TARGET).tex
	$(TEX) $(TARGET).tex
