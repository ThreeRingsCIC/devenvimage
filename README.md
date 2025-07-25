## DevEnvImage

An automated repository for building a skeletal Docker image to bootstrap _Three Rings_ developers. The resulting image runs Debian and has RVM, a handful of
gems including Passenger, and a retro copy of OpenSSL 1.1.1w pre-compiled in. This facilitates faster bootstrapping of dev/test environments for those that
use Docker for this.

Unless you're actively working on developing _Three Rings_, this is useless to you.

### Usage

1. Include `image: ghcr.io/threeringscic/devenvimage:main` in your `compose.yml`.
2. Set a `working_dir:` and `entrypoint:`. Your entrypoint script will probably want to run via `bash -lc` to ensure RVM (which expects a login shell) works.
3. Furthermore, your entrypoint should check for the `.ruby-version` you want and install it with `rvm install` if necessary.

### Explore

Files in this repo:

- `Dockerfile` - the Docker configuration tempalate
- `Gemfile`/`Gemfile.lock`/`lib/runt-rails` - gems to pre-install into the image: copy new ones from the primary repo when these change

### Updating

To update this image, edit `Dockerfile` and/or update the gem dependencies. Then just merge/push into the `main` branch and GitHub will do the rest. The
process is defined in `.github/workflows.build.yml`.

### License

In the unlikely event that you can make use of this repository, it's licensed under the GNU Affero General Public License v3.0.
