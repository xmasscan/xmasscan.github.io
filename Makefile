.PHONY: all

# Constants
# Metadata File
METADATA := metadata.yml
# Blog Template File
TEMPLATE := template.html
# Blog CSS
CSS := css/blog.css
# Blog Sitemap
BLOG := blog.html
# Scripts Directory
SCRIPTS := scripts

# Directory with markdown, christened "content"
SOURCE := content
# Build Directory
TARGET := blog
SOURCE_EXT := md
TARGET_EXT := html

# Build Pandoc Command Template
PANDOC_FLAGS := --template $(TEMPLATE) 
PANDOC_FLAGS += -s
PANDOC_FLAGS += --metadata-file $(METADATA)
PANDOC = pandoc $(PANDOC_FLAGS)

# Gather all markdown files in source folder
# SOURCE_FILES ~ SOURCE/file.md
SOURCE_FILES := $(wildcard $(SOURCE)/*.md) 
# Build desired Target files of pattern: TARGET_FOLDER/file.TARGET_EXTENSTION 
# Replace Source Extension with Target Extension
TARGET_FILES := $(patsubst %$(SOURCE_EXT),%$(TARGET_EXT),$(SOURCE_FILES))
# Replace Source Folder with Target Folder
TARGET_FILES := $(patsubst $(SOURCE)/%,$(TARGET)/%,$(TARGET_FILES))

$(TARGET)/%.html : $(SOURCE)/%.md
	$(info $<)
	$(PANDOC) $< -o $@

# When an article is added/removed, update blog.html
$(BLOG): $(SOURCE)
	$(shell $(SCRIPTS)/blog.sh)

# Update Blog if any article
blog: $(TARGET_FILES) $(BLOG)

all: blog
