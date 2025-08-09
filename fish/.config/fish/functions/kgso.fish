function kgso
    kubectl get secret $argv -o json \
    | jq -r '.data | to_entries[] | "\(.key)=\(.value | @base64d)"'
end
complete -c kgso -w "kubectl get secret"
