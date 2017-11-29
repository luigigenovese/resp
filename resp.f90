!> @file
!!   SparseLib matrix operations
!! @author
!!   Copyright (C) 2017 SparseLib developers
!!
!!   SparseLib is free software: you can redistribute it and/or modify
!!   it under the terms of the GNU Lesser General Public License as published by
!!   the Free Software Foundation, either version 3 of the License, or
!!   (at your option) any later version.
!!
!!   CheSS is distributed in the hope that it will be useful,
!!   but WITHOUT ANY WARRANTY; without even the implied warranty of
!!   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!!   GNU Lesser General Public License for more details.
module resp
  implicit none

  private

  type :: resp_matrix
     integer :: ndummy ! placeholder for derived datatype components
  end type resp_matrix

  type :: resp_vector
     !fundamental object defining a (potentially) sparse matrix
     integer :: ndummy
  end type resp_vector

  contains

    !! Constructors
    function resp_matrix_create(dict_options) result(sm)
      !initialize the resp_matrix object, that might be filled and allocated afterwards
      implicit none
      type(dictionary), pointer :: dict_options ! dictionary containing the initialization options
      type(resp_matrix) :: sm
    end function resp_matrix_create

    subroutine resp_matrix_set(sm)
      !allocate the memory
      type(resp_matrix) :: sm !matrix to be allocated, should be initialized first
    end subroutine resp_matrix_set

    subroutine resp_matrix_copy(sm) result(smcopy)
      ! A copy constructor for matrices
      type(resp_matrix), intent(in) :: sm ! input matrix to copy
      type(resp_matrix), intent(inout) :: smcopy
    end subroutine resp_matrix_copy

    subroutine resp_matrix_destroy(sm)
      ! A destructor for matrices
      type(resp_matrix), intent(inout) :: sm ! input matrix to copy
    end subroutine resp_matrix_destroy

    !! I/O Routines
    subroutine resp_matrix_readcheckpoint(sm, file_name)
      ! Some sort of routine that reads an internal file
      ! representation from disk as efficiently as possible for checkpointing.
      ! In NTPoly this reads a binary file.
      type(resp_matrix), intent(inout) :: sm ! input matrix to write
      character(len=*), intent(in) :: file_name ! name of the file to read
    end subroutine resp_matrix_readcheckpoint

    subroutine resp_matrix_writecheckpoint(sm, file_name)
      ! Some sort of routine that writes an internal file
      ! representation to disk as efficiently as possible for checkpointing.
      ! In NTPoly this writes a binary file.
      type(resp_matrix), intent(in) :: sm ! input matrix to write
      character(len=*), intent(in) :: file_name ! name of the file to write
    end subroutine resp_matrix_writecheckpoint

    subroutine resp_matrix_readmatrixmarket(sm, file_name)
      ! Read the matrix from file using the matrix market format
      type(resp_matrix), intent(inout) :: sm ! input matrix to write
      character(len=*), intent(in) :: file_name ! name of the file to write
    end subroutine resp_matrix_readmatrixmarket

    subroutine resp_matrix_writetomatrixmarket(sm, file_name)
      ! Write the matrix to file using the matrix market format
      type(resp_matrix), intent(in) :: sm ! input matrix to write
      character(len=*), intent(in) :: file_name ! name of the file to write
    end subroutine resp_matrix_writetomatrixmarket

    !! Conversion Routines
    subroutine resp_matrix_fromtripletlist(sm, triplet_list)
      ! Fill in the values of the matrix using a list of triplets:
      ! (row, column, value). This is like the coo_matrix constructor in `SciPy
      ! <https://docs.scipy.org/doc/scipy/reference/generated/scipy.sparse.coo_matrix.html>`_
      type(resp_matrix), intent(in) :: A ! input matrix to convert
      type(triplet_list), intent(out) :: triplet_list ! output list
    end subroutine resp_matrix_fromtripletlist

    !! Operations
    subroutine resp_axpy(A, B, alpha)
      ! Increment a matrix.
      ! B = alpha*A + B
      type(resp_matrix), intent(in) :: A ! Matrix To Add
      type(resp_matrix), intent(inout) :: B ! Matrix to accumulate in
      real(fp), intent(in) :: alpha ! Scaling factor
    end subroutine resp_axpy

    function resp_dot(A, B) result(value)
      ! Compute the dot product of two matrices.
      type(resp_matrix), intent(in) :: A, B ! Matrices to dot together
      real(fp) :: value
    end function resp_dot

    subroutine resp_gemm(A,B,C)
      !perform a matrix-matrix multiplication
      !this routine is note meant to be a constructor for the matrix C
      type(resp_matrix), intent(in) :: A,B !use the documentation of :f:type:`resp_matrix`
      type(resp_matrix), intent(inout) :: C !output matrix, should have bes set first
    end subroutine resp_gemm

    function resp_norm(sm) result(value)
      ! Compute the norm of a matrix.
      ! Maybe there should be a parameter to specify which norm?
      type(resp_matrix), intent(in) :: sm ! Matrix to compute the norm of.
      real(fp) :: value
    end function resp_norm

    subroutine resp_scal(sm, alpha)
      ! Scale a matrix by a constant.
      ! A = A*alpha
      type(resp_matrix), intent(in) :: sm ! Matrix To Scale
      real(fp), intent(in) :: alpha ! Scaling factor
    end subroutine resp_scal

    function resp_trace(sm) result(value)
      ! Compute the trace of a matrix.
      type(resp_matrix), intent(in) :: sm ! Matrix to compute the trace of.
      real(fp) :: value
    end function resp_trace

    function resp_transpose(A) result(AT)
      ! Compute the transpose of a matrix
      type(resp_matrix), intent(in) :: A ! input matrix to transpose
      type(resp_matrix) :: AT
    end function resp_transpose

    !! Basic Data Access
    function resp_matrix_getdescriptor(sm) result(data)
      ! Get a dictionary which describes the features of this matrix.
      ! For example: rows, columns, non-zero entries, symmetry, etc.
      type(resp_matrix), intent(in) :: sm ! matrix to get information about
      type(dictionary), pointer :: data
    end function resp_matrix_getdescriptor


end module resp
