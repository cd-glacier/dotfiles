
complete --no-files \
  --command grpc-call \
  --long-option "host" \
  --description "--host=localhost:8080"

complete --no-files \
  --command grpc-call \
  --long-option "authority" \
  --description "override authority header"

complete --no-files \
  --command grpc-call \
  --long-option "proto-root" \
  --description "--proto-root=./proto"

complete --no-files \
  --command grpc-call \
  --long-option "package" \
  --description "package name. --package=hoge.services.v1"

complete --no-files \
  --command grpc-call \
  --long-option "service" \
  --description "service name"

complete --no-files \
  --command grpc-call \
  --long-option "method" \
  --description "you are calling method. --method=ListHoges"

complete --no-files \
  --command grpc-call \
  --long-option "meta" \
  --description "metadata. --meta=user_id:123,hoge:foo"

complete --no-files \
  --command grpc-call \
  --long-option "message" \
  --description "message. --message='{user_id: 1234}'"

