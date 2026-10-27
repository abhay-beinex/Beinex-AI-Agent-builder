Add-Type -AssemblyName System.IO.Compression.FileSystem
$docx = Resolve-Path "Beinex_AI_Agent_Workflow_Builder_PRD (1).docx"
$zip = [System.IO.Compression.ZipFile]::OpenRead($docx.Path)
$entry = $zip.GetEntry("word/document.xml")
$stream = $entry.Open()
$reader = New-Object System.IO.StreamReader($stream)
$xmlText = $reader.ReadToEnd()
$reader.Close()
$stream.Close()
$zip.Dispose()

[xml]$xml = $xmlText
$ns = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
$ns.AddNamespace("w", "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
$paragraphs = $xml.SelectNodes("//w:p", $ns)
$lines = @()
foreach ($p in $paragraphs) {
    $tNodes = $p.SelectNodes(".//w:t", $ns)
    $line = ""
    foreach ($t in $tNodes) { $line += $t.InnerText }
    if ($line.Trim().Length -gt 0) { $lines += $line }
}
$fullText = $lines -join "`r`n"
[System.IO.File]::WriteAllText("prd_extracted_text.txt", $fullText, [System.Text.Encoding]::UTF8)
Write-Output ("Extracted characters: " + $fullText.Length)
