# Contributing to cortex-helm-chart

Thank you for your interest in contributing to the cortex-helm-chart project!

## How to Contribute

1. **Fork the repository** and create your branch from `master`.
2. **Make your changes** in the appropriate files (for example, `README.md.gotmpl` or `values.yaml`).
3. **Update the generated README.md**:

   The `README.md` file is generated automatically. After making changes to `README.md.gotmpl` or `values.yaml`, run the following command to update `README.md`:

   ```sh
   make README.md
   ```

   This command uses [helm-docs](https://github.com/norwoodj/helm-docs) in a Docker container to regenerate the documentation.

4. **Commit your changes**, including the updated `README.md`.
5. **Push your branch** and open a Pull Request with a clear description of your changes.

## Guidelines

- Please discuss any major changes via issue before submitting a pull request.
- Ensure your code and documentation changes are clear and concise.
- Follow the existing style and conventions of the repository.

Thank you for helping improve cortex-helm-chart!
