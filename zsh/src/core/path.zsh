# Rust Binary
if [[ -e "/home/main/.cargo/bin" ]]; then
  path+=('/home/main/.cargo/bin')
else
  echo "Rust Cargo Bin Does Not Exist"
fi

export PATH
