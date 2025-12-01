VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub ClassifyRFM()
    Dim lastRow As Long
    lastRow = Cells(Rows.Count, "A").End(xlUp).Row   ' Column A = RFM

    Dim rfm As String
    Dim R As Integer, F As Integer, M As Integer
    Dim segment As String

    For i = 2 To lastRow   ' data start from line 2
        rfm = Cells(i, "A").Value
        ' If not a 3 character string => ignore
        If Len(rfm) = 3 Then
            R = Mid(rfm, 1, 1)
            F = Mid(rfm, 2, 1)
            M = Mid(rfm, 3, 1)

            ' Segment classification rules
            ' 1. VIP
            If (R = 4 And (F = 4 Or F = 3) And (M = 4 Or M = 3)) Then
                segment = "VIP"
            ' 2. Loyal
            ElseIf (R >= 3 And F >= 3) Then
                segment = "Loyal"
            ' 3. Potential
            ElseIf (R >= 3 And (F = 2 Or M >= 3)) Then
                segment = "Potential"
            ' 4. At Risk
            ElseIf (R <= 2 And F <= 2) Then
                segment = "At Risk"
            ' 5. Lost
            Else
                segment = "Lost"
            End If
            ' Output in column B
            Cells(i, "B").Value = segment
        End If
    Next i
    MsgBox "RFM segmentation creates completely!", vbInformation
End Sub

