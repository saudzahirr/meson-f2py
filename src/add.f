      SUBROUTINE ADD(A, B, C, N)
      INTEGER N, I
      DOUBLE PRECISION A(N), B(N), C(N)

      DO I = 1, N
         C(I) = A(I) + B(I)
      END DO

      RETURN
      END
