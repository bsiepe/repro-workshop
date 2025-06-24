QMD_FILES = scripts/01_einleitung.qmd scripts/02_praxis.qmd scripts/03_fortgeschritten.qmd
HTML_FILES = $(QMD_FILES:.qmd=.html)
PDF_FILES = $(QMD_FILES:.qmd=.pdf)

all: html pdf

# Render .qmd to .html (revealjs)  
scripts/%.html: scripts/%.qmd
	quarto render $< --to revealjs

# Render .qmd directly to PDF
scripts/%.pdf: scripts/%.qmd
	quarto render $< --to pdf

html: $(HTML_FILES)

pdf: $(PDF_FILES)

.PHONY: all html pdf