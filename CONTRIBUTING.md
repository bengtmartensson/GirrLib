# Contributing

Due to the nature of this "project", contributions are not explicitly solicited.
However, high-quality contributions are welcome.

## Requirements
I check all contributions as far as I can.
For obvious reasons, I cannot check that the signals really are recognized by the claimed device.
However, I check some formal requirements.

There are many possible and sensible requriements that can be formulated on collections of IR-Commands.
(For example, the Lirc project "strongly recommends" (?) using commands names like `KEY_POWER`,
(indicating that they confuse commands with buttons).)
The [Girr format](http://www.harctoolbox.org/Girr.html) contains a few such rules.
While it is defined by a [W3C Schema](https://en.wikipedia.org/wiki/XML_Schema_(W3C)), these rules can be checked by the XML parser.

For contributions to be accepted, it is imperative that the files are valid with respect to the Girr schema.
No other rules for e.g. names are in effect.

A validation possibility in IrScrutinizer is [planned](https://github.com/bengtmartensson/harctoolboxbundle/issues/231).

It is recommended that submitted files contain the parameter- and the Pronto Hex form.
