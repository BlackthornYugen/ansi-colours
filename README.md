# Check certs
Given a text file with certificate paths, verify that each URL is providing the latest certificate
and send emails for each certificate within 21 days of expiration.

## Usage

```shell
./run.sh check_certs <<_ 
/home/svc_acme/.acme.sh/jskw.ca_ecc/jskw.ca.cer
/home/svc_acme/.acme.sh/jskw.dev_ecc/jskw.dev.cer
_
```

# CSV to HTML
Convert csv data to an html table.

## Usage
Usage: `./run.sh csv_to_html < some_stuff.csv`

```shell
./run.sh csv_to_html <<_
OBJECTID,BIA_NAME,RULEID,SHAPEAREA,SHAPELEN
1,HESPELER,,77848.1260806406,3267.51589169133
2,GALT,,243164.599401387,3217.42021359131
3,PRESTON,,118523.262606792,1864.71142592139
_
```

```html
<style>
    tr:nth-child(even) {
        background: gray;
        color: white;
    }

    tr {
        background-color: lightgray;
    }
</style>
<table>
<tr><th>OBJECTID</th><th>BIA_NAME</th><th>RULEID</th><th>SHAPEAREA</th><th>SHAPELEN</th></tr>
<tr><td>1</td><td>HESPELER</td><td></td><td>77848.1260806406</td><td>3267.51589169133</td></tr>
<tr><td>2</td><td>GALT</td><td></td><td>243164.599401387</td><td>3217.42021359131</td></tr>
<tr><td>3</td><td>PRESTON</td><td></td><td>118523.262606792</td><td>1864.71142592139</td></tr>
</table>
```

[Kitchener Open Data](https://open-kitchenergis.opendata.arcgis.com/) - [Business Improvement Areas](https://open-kitchenergis.opendata.arcgis.com/datasets/cityofcambridge::business-improvement-areas/about)

# Fizz Buzz
It echos fizz for numbers evenly divisible by 3, buzz for numbers divisible by 5, and 
fizzbuzz for both.

## Usage
Usage: `./run.sh fizz_buzz [number]

```shell
./run.sh fizz_buzz 3
FIZZ!

./run.sh fizz_buzz 15
FIZZBUZZ!

./run.sh fizz_buzz 1
1
```

# ANSI Colours
It prints out the ansi colours as described in [Haoyi's blog post](https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html) for Python but adapted to sh. Just wanted to make something to play with shellspec.

## Usage
Usage: `./run.sh print_colours [max_number] [colours_per_line]

```shell
./run.sh print_colours
   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31
  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47
  48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
  64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
  80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
  96  97  98  99 100 101 102 103 104 105 106 107 108 109 110 111
 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255


./run.sh print_colours 30 8
   0   1   2   3   4   5   6   7
   8   9  10  11  12  13  14  15
  16  17  18  19  20  21  22  23
  24  25  26  27  28  29  30
```

# Tests
Asuming you have shellspec on your path, test by running `shellspec` from the root. Check out [shellspec.info](https://shellspec.info/) for installation instructions.

```shell
shellspec
```

```shell
ANSI Colour tests
Running: /bin/sh [sh]

fizzbuzz
  should say 1 for 1
  should say 2 for 2
  should say BUZZ! for 3
  should say 4 for 4
  should say FIZZ! for 5
  should say 6 for 6
  should say BUZZ! for 13
  should say FIZZ! for 15
  should say FIZZBUZZ! for 35
  should say FIZZBUZZ! for 53
  should say FIZZBUZZ! for 350
  should say FIZZBUZZ! for 305

ansi colours
  should end with a colour reset
  should be single spaced
  should reach
    1
    2
    100
    254
    255
  when called with
    255 16, should wrap correctly
    30 3, should wrap correctly
    254 32, should wrap correctly
    255 16, the output should end with 255
    30 3, the output should end with 30
    254 32, the output should end with 254
  contain colour data along with numbers

Finished in 0.40 seconds (user 0.34 seconds, sys 0.10 seconds)
26 examples, 0 failures
```
