# Slide files (RevealJS presentations)
SLIDE_FILES = scripts/01_einleitung.qmd scripts/02_praxis.qmd scripts/03_fortgeschritten.qmd
SLIDE_HTML_FILES = $(SLIDE_FILES:.qmd=.html)
SLIDE_PDF_FILES = $(SLIDE_FILES:.qmd=.pdf)

# Exercise files (regular HTML documents)
EXERCISE_FILES = praxis/aufgabe_01.qmd praxis/aufgabe_01_loesung.qmd \
                 praxis/aufgabe_02.qmd praxis/aufgabe_02_loesung.qmd \
                 praxis/aufgabe_03.qmd praxis/aufgabe_03_loesung.qmd \
                 praxis/aufgaben_loesung_komplett.qmd
EXERCISE_HTML_FILES = $(EXERCISE_FILES:.qmd=.html)

all: slides exercises

# Render slide .qmd files to .html (revealjs)
scripts/%.html: scripts/%.qmd
	quarto render $< --to revealjs

# Render slide .html to .pdf using decktape
scripts/%.pdf: scripts/%.html
	decktape reveal $< $@

# Render exercise .qmd files to .html (regular HTML)
praxis/%.html: praxis/%.qmd
	quarto render $< --to html

# Targets
slides: $(SLIDE_HTML_FILES)
slides-pdf: $(SLIDE_PDF_FILES)
exercises: $(EXERCISE_HTML_FILES)

.PHONY: all slides slides-pdf exercises