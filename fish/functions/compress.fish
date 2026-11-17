function compress
  tar -czf (string trim -r -c / -- $argv[1]).tar.gz $argv[1]
end
