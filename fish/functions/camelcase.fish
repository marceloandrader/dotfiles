function camelcase
  perl -pe 's#(_|^)(.)#\u$2#g'
end
