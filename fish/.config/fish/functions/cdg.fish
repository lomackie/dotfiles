# cdg: jump (zoxide) to the repo root if inside a git repo, else normal z
functions -e cdg ^/dev/null
function cdg
    if git rev-parse --is-inside-work-tree ^/dev/null
        set -l root (git rev-parse --show-toplevel ^/dev/null)
        z --basedir $root
    else
        z
    end
end
