.PHONY: faction-abilities.pdf all clean scripts copy docs

all: faction-abilities.pdf

faction-abilities.pdf: faction-abilities.tex
				lualatex faction-abilities.tex -synctex=1 -interaction=nonstopmode -file-line-error -pdf %DOC%
				open -a Skim.app faction-abilities.pdf

clean:
				latexmk -CA

# need to copy powers from root dir to _data dir for github pages
# since symlink does not seem to be working
copy:
				cp powers_final.yml docs/_data/powers_final.yml

scripts:
				python scripts/abilities_to_tex.py

docs:
				python Scripts/create_pages.py
				cd docs && bundle exec jekyll build && bundle exec jekyll serve