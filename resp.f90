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

    subroutine resp_gemm(A,B,C)
      !perform a matrix-matrix multiplication
      !this routine is note meant to be a constructor for the matrix C
      type(resp_matrix), intent(in) :: A,B !use the documentation of :f:type:`resp_matrix`
      type(resp_matrix), intent(inout) :: C !output matrix, should have bes set first
    end subroutine resp_gemm

end module resp


