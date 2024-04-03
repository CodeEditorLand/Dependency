# DESTRUCTIVE OPERATION

1. Add organizational details to all of the `package.json` inside `Application`
   (The Context)

    ```sh
    ../Append/Detail.sh
    ```

2. Remove all of the tags and (Prettier, Biome, Rome, ) from the repositories
   inside `Application` (The Context)

    ```sh
    ../Clean/Repository.sh
    ```

3. Sync repositories with their upstream:

    ```sh
    cd Land # (The Context)
    ```

    and sync:

    ```sh
    ../Script/Sync/Repository.sh
    ```

4. Move src into the Source folder:

    ```sh
    cd Land # (The Context)
    ```

    and move:

    ```sh
    ../Script/Move/src.sh
    ```

5. Reset repositories to their their upstream breanches:

    ```sh
    cd Land # (The Context)
    ```

    and sync:

    ```sh
    ../Script/Sync/Repository.sh
    ```

# Organization

1. (Owner) Fork all of the repositories from the Microsoft organization

    ```sh
    ../Script/Fork/Organization.sh
    ```

# Repository

1. After cloning the repository
   `ssh://git@github.com/CodeEditorLand/Foundation.git`:

    ```sh
    cd Land # (The Context)
    ```

    and populate the cache:

    ```sh
    ../Script/Cache/Get.sh
    ```

2. After the cache is populated clone all of the repositories:

    ```sh
    cd Land # (The Context)
    ```

    and clone:

    ```sh
    ../Script/Clone/Repository.sh
    ```

3. After all of the repositories are cloned configure their upstream:

    ```sh
    cd Land # (The Context)
    ```

    and configure:

    ```sh
    ../Script/Configure/Repository.sh
    ```

4. (Owner) Set the permissions for all the repositories and common settings:

    ```sh
    cd Land # (The Context)
    ```

    and set:

    ```sh
    ../Setting/Repository.sh
    ```
