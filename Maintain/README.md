# DESTRUCTIVE OPERATION

1. Add organizational details to all of the `package.json` inside `Application`
   (The Context)

    ```sh
    ../Append/Detail.sh
    ```

2. Remove all of the tags and (Prettier, Biome, Rome, ) from the `Source` inside
   `Application` (The Context)

    ```sh
    ../Clean/Repository.sh
    ```

3. Sync `Source` with their `Parent`:

    ```sh
    cd Land # (The Context)
    ```

    and sync:

    ```sh
    ../Script/Sync/Repository.sh
    ```

4. Move src into the `Source` folder:

    ```sh
    cd Land # (The Context)
    ```

    and move:

    ```sh
    ../Script/Move/src.sh
    ```

5. Reset `Source` to their their `Parent` breanches:

    ```sh
    cd Land # (The Context)
    ```

    and sync:

    ```sh
    ../Script/Sync/Repository.sh
    ```

# Organization

1. (Owner) Fork all of the `Source` from the Microsoft organization

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

2. After the cache is populated clone all of the `Source`:

    ```sh
    cd Land # (The Context)
    ```

    and clone:

    ```sh
    ../Script/Clone/Repository.sh
    ```

3. After all of the `Source` are cloned configure their `Parent`:

    ```sh
    cd Land # (The Context)
    ```

    and configure:

    ```sh
    ../Script/Configure/Repository.sh
    ```

4. (Owner) Set the permissions for all the `Source` and common settings:

    ```sh
    cd Land # (The Context)
    ```

    and set:

    ```sh
    ../Setting/Repository.sh
    ```
