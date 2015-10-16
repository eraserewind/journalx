# journalx

This application forwards log messages from Linux's `/dev/log` and `/dev/klog` to a GenEvent process. Based on [fhunleth/l2elog](https://github.com/fhunleth/l2elog).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add journalx to your list of dependencies in `mix.exs`:

        def deps do
          [{:journalx, "~> 0.0.1"}]
        end

  2. Ensure journalx is started before your application:

        def application do
          [applications: [:journalx]]
        end

## Usage

Add or remove an handler:

```
Journalx.add_handler(MyHandler)
Journalx.remove_handler(MyHandler)
```

Log event: `{:log, priority :: 0..7, message :: String.t}`

