# DESTRUCTIVE OPERATIONS

1. Adds organizational details to all of the `package.json` inside `Application`
   (The Context)

    ```bash
    ../Append/Detail.sh
    ```

2. Removes all of the tags and (Prettier, Biome, Rome, ) from the repositories
   inside `Application` (The Context)

    ```bash
    ../Clean/Repository.sh
    ```

3. Renames repositories containing VSCode and dashes inside `Application` (The
   Context)

    ```bash
    cd Application # (The Context)
    ```

    and rename:

    ```bash
    ../Rename/Repository.sh
    ```

4. Syncs repositories with their upstream:

    ```bash
    cd Application # (The Context)
    ```

    and sync:

    ```bash
    ../Script/Sync/Repository.sh
    ```

5. Moves src into the Source folder:

    ```bash
    cd Application # (The Context)
    ```

    and move:

    ```bash
    ../Script/Move/src.sh
    ```

# Organization

1. (Owner) Fork all of the repositories from the Microsoft organization

    ```bash
    ../Script/Fork/Organization.sh
    ```

# Repository

1. After cloning the repository
   `ssh://git@github.com/CodeEditorLand/CodeEditorLand.git`:

    ```bash
    cd Application # (The Context)
    ```

    and populate the cache:

    ```bash
    ../Script/Cache/Get.sh
    ```

2. After the cache is populated clone all of the repositories:

    ```bash
    cd Application # (The Context)
    ```

    and clone:

    ```bash
    ../Script/Clone/Repository.sh
    ```

3. After all of the repositories are cloned configure their upstream:

    ```bash
    cd Application # (The Context)
    ```

    and configure:

    ```bash
    ../Script/Configure/Repository.sh
    ```

4. (Owner) Set the permissions for all the repositories and common settings:

    ```bash
    cd Application # (The Context)
    ```

    and set:

    ```bash
    ../Setting/Repository.sh
    ```
