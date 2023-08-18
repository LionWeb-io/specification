(gh issue list --limit 1000 --state all) |
Sort-Object {[int]($_ -replace '(\d+).*', '$1')} |
Foreach-Object {
	$members = $_ -split '\t'
	$id = $members[0]
	$title = $members[2]
	":fn-org${id}: footnote:org${id}[https://github.com/LIonWeb-org/organization/issues/${id}[${title} #${id}]]"
} |
out-file -encoding utf8 issue-footnotes.adoc