# frozen_string_literal: true

# rubocop:disable Layout/CommentIndentation -- indent however you need to in this file!

# Ruby version for Three Rings
ruby '2.6.10'
# Tested with Bundler 2.3.22 - gem install bundler:2.3.22

# Gem required by Three Rings
source 'https://rubygems.org'
# source 'http://gems.github.com'

# Temporal Expressions engine for shift patterns
# Overrides "Numeric", so must be loaded BEFORE Rails (which also does so)
gem 'runt-rails', path: 'lib/runt-rails/'

# Core requirements - Rubygems, Rails, MySQL, JSON, JS parser
# Rubygems 1.8.25 adds compatability for complex gemspacs (e.g. as used by ZenTest); Rubygems 2.0.0 does NOT yet
# BUT Rubygems requirement can't be managed by bundler - install it yourself, e.g. "rvm install rubygems 1.8.25"
gem 'rails',                      '~> 5.2.8.1'                          # Rails 5.x adds Action Cable, typed model attributes, ...
gem 'mysql2',                     '0.5.5'                               # Connecting to the database needs this!
gem 'mini_racer',                 '~> 0.6.3'                            # Ruby<->JS bridge, replacing therubyracer; supports V8 8.x+ so it works on M1 chips

gem 'thin'                                                              # Dev webserver (instead of Puma, Webrick etc.)

# Former Rails 3.1.x asset pipeline (now loaded as standard gems)
gem 'sass-rails',                 '~> 5.0.7'                            # SASS -> CSS support in the asset pipeline
gem 'coffee-rails',               '~> 4.2.2'                            # Coffee -> JS support in the asset pipeline
gem 'terser'                                                            # Slightly-more-modern-than-Uglifier JS compression/optimisation for Rails

gem 'jquery-rails',               '>= 4.3.3'

# Gems from the default Rails 4 application skeleton
gem 'jbuilder', '~> 2.7'                                                # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.2',                        group: :doc              # bundle exec rake doc:rails generates the API under doc/api.
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', '~> 2.0.2',                      group: :development

# Application-specific gems
gem 'dotenv-rails',                 groups: [:test, :development, :production] # .env file for ENV variable support; friendly sane configuration management
gem 'authlogic',                  '~> 3.8.0'                            # prior to 3.5.4 official, we used this fork: https://github.com/drhenner/authlogic
gem 'rb-readline',                '~> 0.5.5'                            # Need 0.4.2 or less, or 0.5.0 or higher to avoid console crashes
gem 'bcrypt',                     '~> 3.1.12'                           # bCrypt hashing (for ActiveModel has_secure_password)
gem 'haml',                       '~> 5.0.4'                            # HAML processor (as opposed to ERb)
gem 'color',                      '~> 1.8'
gem 'colorize',                   '~> 0.8.1'                            # command prompt color codes e.g. "This is blue".colorize(:blue)
gem 'image_science',              '~> 1.3.0',  require: false           # image resizing that doesn't suck: used by paperclip
gem 'RubyInline',                 '~> 3.12.4', require: 'inline'        # required by image_science - enables "inline" compile-on-demand C code
gem 'rdiscount',                  '~> 2.2.0.1'                          # Markdown processor (still needed?)
gem 'spreadsheet',                '~> 1.1', '>= 1.1.7'                  # easy spreadsheet exporting in Excel format
gem 'whenever',                   '~> 0.10.0'                           # runs jobs on a schedule - see config/schedule.rb
gem 'paperclip',                  '~> 5.1.0'                            # stores filestore files, certificates, and volunteer photos
gem 'sucker_punch',               '~> 2.0'                              # concurrent-ruby-powered ActiveJob-compatible background task processing

gem 'paranoia',                   '~> 2.6.0'                            # reimplementation of acts_as_paranoid for Rails 4
gem 'paper_trail',                '~> 13.0.0'                           # track changes to models/versioning - used for WikiPages

gem 'kaminari',                   '~> 1.2.1'                            # pagination (replacement to mislav's will-paginate)
gem 'wicked_pdf',                 '~> 1.1.0'                            # Modern replacement for PDFKit, still uses wkhtmltopdf though
gem 'wkhtmltopdf-binary',         '~> 0.12.6'                           # Embedded version of wkhtmltopdf, simplifies basically everything to do with PDF gen
gem 'icalendar',                  '~> 2.4.1'                            # iCalendar creation/parsing
gem 'donncha-validates_as_email', '~> 0.6.1'                            # email validation w/ Ruby 1.9 compatability (replaces old validates_as_email pluging)
gem 'acts_as_list',               '~> 0.9.15'                           # replaces old acts_as_list plugin
gem 'acts_as_tree',               '~> 2.9.1'                            # replaces old acts_as_tree plugin
gem 'rails_autolink',             '~> 1.1.8'                            # re-adds Rails 3 "auto_link" method (used by threerings_auto_link helper, etc.)
gem 'rotp',                       '~> 6.3.0'                            # Google Authenticator
gem 'yubikey',                    '~> 1.4.1'                            # YubiKey
gem 'protected_attributes_continued', '~> 1.5.0'                        # re-adds attr_accessible and attr_protected methods; forked from protected_attributes
gem 'sanitize',                   '~> 6.1.3'                            # HTML whitelisting
gem 'dalli',                      '~> 3.2.4'                            # modern replacement to memcache-client gem; enables memcache-storage
gem 'clamav-client',              '~> 3.1.0', require: 'clamav/client'  # ClamAV (antivirus) daemon integration
gem 'zxcvbn-js',                  '~> 4.4.3', require: 'zxcvbn'         # server-side password validation (from zxcvbn.js) [zxcvbn-ruby has issues for us]
gem 'omniauth-google-oauth2',     '~> 0.5.3'                            # Google Account authentication using OAuth2
gem 'omniauth-salesforce'
gem 'zip_tricks',                 '~> 5.5'                              # Creating ZIP files in Filestore
gem 'rqrcode',                    '~> 2.2'                              # Generating QR codes

gem 'clickatell',                 '~> 0.8.2'                            # Clickatell Communicator (http://clickatell.rubyforge.org/)
gem 'rest-client',                '~> 2.0.2'                            # Clickatell Platform, Mapbox API, and possibly other things down the line too
gem 'nexmo',                      '~> 4.8.0'                            # Nexmo SMS gateway (4.5 available - upgrade?); see also vonage, below
gem 'vonage',                     '>= 7.8.2'                            # Vonage are the company who took over Nexmo; their API is migrating towards/into this
gem 'pil',                        '~> 0.3.0'                            # Allows Pil.include?(password) to check for common passwords in "Top 10,000" List
gem 'exception_notification',     '~> 4.2.2'                            # emails us on 500 errors
gem 'slack-notifier'                                                    # sends those 500s to Slack, too
gem 'faker',                      '>= 1.9.1'                            # generating random data (rake 3r:demo:reset)
gem 'vpim',                       '~> 13.11.11'                         # produces iCal, vCard, etc.
gem 'color_contrast_calc',        '~> 0.9.0'                            # calculates contrast ratio between two colors for Theme foreground color selection
gem 'precise_distance_of_time_in_words', '~> 0.0.3'                     # fork of dotiw with support for Rails 4, apparently
gem 'webauthn',                   '~> 3.0'                              # WebAuthn support for passkeys
gem 'user_agent_parser',          '~> 2.20'                             # browser & OS identification from user agent string, for passkey nicknames

# Amazon Web Services APIs:
gem 'aws-sdk-sesv2',              '~> 1', '>= 1.41.0'                   # talk to the AWS SES API (email suppression list etc.)

# We adapted the Userstamp plugin to our own Volunteerstamp plugin. Then when Userstamp became
# a gem, we used that, but it stopped in 2010 with version 2.0.1, despite having commits against
# the repo that fixed some of our problems, so we made our own 2.0.2. But that didn't work in
# Rails 4, so we switched to the magiclabs/userstamp fork,
# But when we switched to Rails 5 we found that it didn't support optional: true, so we switched to the lowjoel/activerecord-userstamp fork
# This one uses methods that are deprecated by Rails 5.1, so we switched to Dan-Q/activerecord-userstamp
gem 'activerecord-userstamp',     '~> 3.0.6', git: 'https://github.com/Dan-Q/activerecord-userstamp.git'

gem 'dynamic_form',               '~> 1.1.4'                            # provides old-style error_messages_for/error_messages_on helpers, etc.
gem 'single_test',                '>= 0.6.0'                            # easily run individual tests (https://github.com/grosser/single_test)
                                                                        # adds rake tasks via Rakefile; so can't be in development/test group
gem 'non-stupid-digest-assets',   '>= 1.0.9'                            # prevents compiled stylesheets etc. having stupid digests, which break our static pages

gem 'stripe',                     '>4.0.2'                              # Interface to Stripe electronics payments system
gem 'breadcrumbs_on_rails',       '~> 3.0', '>= 3.0.1'                  # Adds a simple breadcrumb libary for admin page.
gem 'rouge',                      '~> 3.1.1'                            # Fixes already initalised warnings
gem 'thor',                       '~> 0.20.3'                           # Prevents 'rails g' => "Expected string default value for '--jbuilder'" bug
gem 'sassc',                      '~> 1.12', '>= 1.12.1'                # SASS C library ported back to Ruby, used for speedy theme compilation
gem 'actionmailer-text',          '~> 0.1.1'                            # Automatic generation of the text part of multipart emails based on the HTML part

gem 'diffy', '~> 3.4'                                                   # diff generation in Ruby (used for help pages current/upcoming comparisons)

# Elasticsearch integration for document search
gem 'elasticsearch',              '~> 7.17.0'                           # Elasticsearch client for Ruby

group :development, :test do
  gem 'listen',                   '~> 3.1'                              # File watcher used by ThemeStylesheetStalenessChecker to decide when to recompile CSS
  gem 'fontcustom'                                                      # Generates fonts from a selection of svg icons
  gem 'victor'                                                          # Generates Vectors using ruby
  gem 'victor-cli'                                                      # Converts Vectors into the Ruby used in the above.
  gem 'rufo',                     '~> 0.12.0'
  gem 'simplecov',                '>= 0.16.1'                           # coverage analysis
  gem 'byebug',                   '>= 10.0.2'                           # Alternative debugger with GREAT Ruby 2.x support
  gem 'rails-erd'                                                       # Generates an Entity-Relationship diagram of our models - use 'rake erd'
  gem 'bullet'                                                          # Provides hints for query improvements
  gem 'factory_bot_rails',        '~> 4.10.0'                           # Used to make factories for testing

  #  gem "bundler-audit", require: false                                   # Gem security version check; run 'bundle-audit'
  gem 'brakeman', require: false                                        # Static analysis security scanner; run 'rake code:brakeman'
  gem 'minitest-reporters', '>= 1.3.0'
  gem 'rails-controller-testing'					                              # Brings extra functionality to testing - including 'assigns'
  gem 'annotate'                                                        # Adds those pretty schema definitions to the top of model/test etc. files

  # Static analysis/linting:
  gem 'rubocop'
  gem 'rubocop-rails_config'
end

eval(IO.read('Gemfile.local'), binding) if File.exist?('Gemfile.local')
