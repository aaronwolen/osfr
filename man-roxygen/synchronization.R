#' @section A note about synchronization:
#' While `osf_download()` and `osf_upload()` can be used to conveniently shuttle
#' files back and forth between OSF and your local machine, it's important to
#' note that **they are not file synchronization functions**. In contrast to
#' something like [`rsync`](https://rsync.samba.org),
#' `osf_download()`/`osf_upload()` do not take into account a file's contents or
#' modification time. Whether you're uploading or downloading, if `overwrite =
#' TRUE`, osfr will overwrite an existing file regradless of whether the
#' existing file is the more recent copy. You have been warned.
