# journalx

This application forwards log messages from Linux's `/dev/log` and `/dev/klog` to a GenEvent process. Based on [fhunleth/l2elog](https://github.com/fhunleth/l2elog).

>While this may seem completely backwards, when using the Nerves framework, Erlang takes a central role and much of the standard Linux userspace is either not needed or minimal. In this environment, most log messages originate in Erlang, but not all. This utility forwards the remainder of those messages so that messages from the kernel and any C programs aren't lost

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

