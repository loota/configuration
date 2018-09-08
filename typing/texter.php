<?php
$pinkyChars = array(
    '1',
    '!',
    '`',
    '~',
    '0',
    ')',
    '-',
    '_',
    '=',
    '+',
    'p',
    'P',
    '[',
    '{',
    ']',
    '}',
    '\\',
    '|',
    ';',
    ':',
    '\'',
    '"',
    '/',
    '?'
);
for ($i=0;$i<70;$i++) {
 $randomPinkyDrill .= $pinkyChars[rand(0, count($pinkyChars))];
}
$typingTemplate = file_get_contents('quick_template.typ');
$typingTemplate = str_replace('___PINKY___', $randomPinkyDrill, $typingTemplate);

$phpOperators = array(
    '\'',
    '-', '=', '+',
    '%', '^', '&', '|', '*', '!', '.', '~', '?', ':',
    '-=', '+=', '*=', '/=', '%=', '^=', '&=', '|=', 
    '.=',
    '$',
    '&&', 'and',
    '||', 'or',
    '->',
    '::'
);



$phpStrings = file_get_contents('php.txt');
$words = explode(' ', $phpStrings);
for ($i=0; $i<20; $i++) {
  if (strlen($phpDrill) > 60) {
      $lines = explode("\n", $phpDrill);
      if (strlen($lines[count($lines) - 1]) > 60) {
          $phpDrill .= "\n";
          $phpDrill .= ' :';
      }
  }
  if (rand(1,3) === 1) {
      $phpDrill .= $phpOperators[rand(0, count($phpOperators))] . ' ';
  }
  if (rand(1,2) === 1) {
      $phpDrill .= '$';
  }
  $word = $words[rand(0, count($words))];
  $wordWithoutNewlines = str_replace("\n", '', $word);
  $phpDrill .=  $wordWithoutNewlines . ' ';
}

$typingTemplate = str_replace('___PHP___', $phpDrill, $typingTemplate);




$textStrings = file_get_contents('text.txt');
$words = explode("\n", $textStrings);
for ($i=0; $i<30; $i++) {
  if (strlen($textDrill) > 60) {
      $lines = explode("\n", $textDrill);
      if (strlen($lines[count($lines) - 1]) > 60) {
          $textDrill .= "\n";
          $textDrill .= ' :';
      }
  }
  $word = $words[rand(0, count($words))];
  $wordWithoutNewlines = str_replace("\n", '', $word);
  $textDrill .=  $wordWithoutNewlines . ' ';
}

$typingTemplate = str_replace('___TEXT___', $textDrill, $typingTemplate);

file_put_contents('quick.typ', $typingTemplate);
//$randomPhpDrill = 
//$randomTextDrill = 
