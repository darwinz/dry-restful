# frozen_string_literal: true

Dry::System.register_provider(
  :dry_stuff,
  boot_path: Pathname(__dir__).join('components').realpath
)
