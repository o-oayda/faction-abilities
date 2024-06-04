.PHONY: faction-abilities.pdf all clean scripts copy docs

all: faction-abilities.pdf

faction-abilities.pdf: faction-abilities.tex
				make scripts
				lualatex faction-abilities.tex -synctex=1 -interaction=nonstopmode -file-line-error -pdf %DOC%
				open -a Skim.app faction-abilities.pdf

clean:
				latexmk -CA

scripts:
				python scripts/abilities_to_tex.py