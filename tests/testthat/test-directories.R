context("Directories")


# setup -------------------------------------------------------------------
p1 <- osf_project_create(title = "osfr-component-tests")


# tests -------------------------------------------------------------------

test_that("empty project/folder returns a osf_tbl_file with 0 rows", {
  out <- osf_ls(p1)
  expect_s3_class(out, "osf_tbl_file")
  expect_equal(nrow(out), 0)
})

test_that("listing a non-existent folder errors", {
  expect_error(osf_ls(p1, path = "data"), "Path does not exist")
})


test_that("create a top-level directory", {
  d1 <- osf_mkdir(p1, path = "dir1")
  expect_s3_class(d1, "osf_tbl_file")
  expect_equal(d1$name, "dir1")
})

test_that("list a top-level directory", {
  out <- osf_ls(p1)
  expect_s3_class(out, "osf_tbl_file")
  expect_equal(nrow(out), 1)
  expect_equal(out$name, "dir1")
})


test_that("create a subdirectory within an existing directory", {
  d11 <- osf_mkdir(p1, path = "dir1/dir11")
  expect_s3_class(d11, "osf_tbl_file")
  expect_equal(d11$name, "dir11")
})

test_that("list a subdirectory", {
  out <- osf_ls(p1)
  expect_equal(nrow(out), 1)
  expect_equal(out$name, "dir1")

  out <- osf_ls(p1, path = "dir1")
  expect_equal(nrow(out), 1)
  expect_equal(out$name, "dir11")
})

test_that("create a subdirectory within an non-existent directory", {
  d21 <- osf_mkdir(p1, path = "dir2/dir21")
  expect_s3_class(d21, "osf_tbl_file")
  expect_equal(d21$name, "dir21")

  d2_attrs <- d21$meta[[1]]$attributes
  expect_equal(d2_attrs$materialized_path, "/dir2/dir21/")
})