SOURCES = \
	feature_processing \
	image_processing \
	index \
	segmentation \

BUILDDIR = docs/
TARGETS = $(addprefix $(BUILDDIR),$(addsuffix .html,$(SOURCES)))

PARAMETERS += --katex
PARAMETERS += --include-after-body template/footer.html
PARAMETERS += --include-before-body template/navbar.html
PARAMETERS += --include-in-header template/header.html
PARAMETERS += --template template/template.html
PARAMETERS += --toc
PARAMETERS += -s -V mainfont="TeX"


all: $(TARGETS)

$(BUILDDIR)%.html : md/%.md $(DEP)
	@mkdir -p $(BUILDDIR) # Make sure build dir exists
	pandoc $(PARAMETERS) $< -o $@

clean:
	@rm -f $(TARGETS)
