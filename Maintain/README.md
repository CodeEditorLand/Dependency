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
   `ssh://git@github.com/CodeEditorLand/Dependency.git`:

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

## Funding & Acknowledgements&#x2001;🙏🏻

**Land**&#x2001;🏞️ is proud to be an open-source endeavor. Our journey is
significantly supported by the organizations and projects that believe in the
future of open-source software.

This project is funded through
[NGI0 Commons Fund](https://NLnet.NL/commonsfund), a fund established by
[NLnet](https://NLnet.NL) with financial support from the European Commission's
[Next Generation Internet](https://ngi.eu) program. Learn more at the
[NLnet project page](https://NLnet.NL/project/Land).

<table>
	<thead>
		<tr>
			<th align="left"><strong>Land</strong></th>
			<th align="left"><strong>PlayForm</strong></th>
			<th align="left"><strong>NLnet</strong></th>
			<th align="left"><strong>NGI0 Commons Fund</strong></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align="left" valign="middle"><a href="https://editor.land"><img width="60" src="https://raw.githubusercontent.com/CodeEditorLand/Asset/refs/heads/Current/Logo/Land.svg" alt="Land" /></a></td>
			<td align="left" valign="middle"><a href="https://PlayForm.Cloud"><img width="76" src="https://raw.githubusercontent.com/PlayForm/Asset/refs/heads/Current/Logo/PlayForm.svg" alt="PlayForm" /></a></td>
			<td align="left" valign="middle"><a href="https://NLnet.NL"><img width="240" src="https://NLnet.NL/logo/banner.svg" alt="NLnet" /></a></td>
			<td align="left" valign="middle"><a href="https://NLnet.NL/commonsfund"><img width="240" src="https://NLnet.NL/image/logos/NGI0CommonsFund_tag_black_mono.svg" alt="NGI0 Commons Fund" /></a></td>
		</tr>
	</tbody>
</table>
