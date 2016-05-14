TARGET = thesis
TEX = pdflatex
BIBTEX = bibtex8
BIBTEX_OPTIONS = -c utf8cyrillic.csf

CLEXT ?= *.aux *.toc *.idx *.ind *.ilg *.log *.out *.lof *.lot *.lol \
  *.bbl *.blg *.bak *.dvi *.ps *.pdf *.synctex *.synctex.gz

all : $(TARGET).pdf

install : all

clean :
	-rm -f $(CLEXT)

$(TARGET).pdf : $(TARGET).tex tex/*.tex *.sty # *.bib
	$(TEX) $(TARGET).tex
#	$(BIBTEX) $(BIBTEX_OPTIONS) $(TARGET).aux
#	$(TEX) $(TARGET).tex
	$(TEX) $(TARGET).tex
