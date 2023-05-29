# Add to .bashrc or .zshrc like so:
# . ~/.config/nvim/etc/profile.sh

export EDITOR=nvim
if [ -n "$ZSH_VERSION" ]; then
  bindkey -e
fi

if [ "$(uname)" = "Darwin" ]; then
  hidutil_setup() {
    /usr/bin/hidutil property --matching '{
          "ProductID":0x342,
          "VendorID":0x5ac
        }' --set '{"UserKeyMapping":[
        {
          "HIDKeyboardModifierMappingSrc": 0x7000000E6,
          "HIDKeyboardModifierMappingDst": 0x7000000E4
        },
        {
          "HIDKeyboardModifierMappingSrc": 0x7000000E7,
          "HIDKeyboardModifierMappingDst": 0x7000000E6
        },
        {
          "HIDKeyboardModifierMappingSrc": 0x700000039,
          "HIDKeyboardModifierMappingDst": 0x700000029
        }
    ]}'
  }

  hidutil_clear() {
    /usr/bin/hidutil property --matching '{
          "ProductID":0x342,
          "VendorID":0x5ac
        }' --set '{"UserKeyMapping":[]}'
  }
fi

alias go-nvim='nvim -u ~/.config/nvim/init_go.lua'
alias py-nvim='nvim -u ~/.config/nvim/init_python.lua'
alias swift-nvim='nvim -u ~/.config/nvim/init_swift.lua'

