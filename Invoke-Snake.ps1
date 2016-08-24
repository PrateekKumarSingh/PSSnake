Function Invoke-Snake()
{

        #Calling the Assemblies
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing.graphics")
        
        #Create the Conatainer Form  to place the Labels and Textboxes
        $Form = New-Object “System.Windows.Forms.Form”;
        $Form.Width = 400;
        $Form.Height = 400;
        $Form.Text = 'PS Love Snake'
        $Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen;
           


            $Font = New-Object System.Drawing.Font("lucida sans",12,[System.Drawing.FontStyle]::Regular) 
		    $Image = [System.Drawing.Bitmap]::new(300,400)
		    $Graphics = [System.Drawing.Graphics]::FromImage($Image)
            $Pen = New-Object System.Drawing.Pen ([System.Drawing.Brushes]::crimson,5)



            $Dot = [System.Drawing.Rectangle]::new(30,30,10,10)

            #Creating the Rectangles
            $Graphics.DrawRectangle($Pen,$Dot)
            $Region = New-Object System.Drawing.Region($Dot)
            $Graphics.FillRegion([System.Drawing.Brushes]::Crimson,$Region)

		    $PictureBox = New-Object System.Windows.Forms.PictureBox
		    $PictureBox.Image = $Image
		    $PictureBox.Height =  700
		    $PictureBox.Width = 600
		    $PictureBox.Sizemode = 'autosize'
		    $PictureBox.BackgroundImageLayout = 'stretch'
            $Form.Controls.Add($PictureBox)
            $event=[System.Windows.Forms.KeyPressEventHandler]{$_.keychar}
            $Form.KeyUp($event)
            $Form.Show()

        $i = 0
        While($true)
        {
            $Image = [System.Drawing.Bitmap]::new(300,400)
		    $Graphics = [System.Drawing.Graphics]::FromImage($Image)
            $Pen = New-Object System.Drawing.Pen ([System.Drawing.Brushes]::crimson,5)
            $Dot = [System.Drawing.Rectangle]::new(30+$i,30,10,10)
            $Dot.Location
            $i=$i+2
            
                        #Creating the Rectangles
            $Graphics.DrawRectangle($Pen,$Dot)
            $Region = New-Object System.Drawing.Region($Dot)
            $Graphics.FillRegion([System.Drawing.Brushes]::Crimson,$Region)

            $PictureBox.Image = $Image
            $PictureBox.Invalidate()
            Start-Sleep -Milliseconds 10
        }

}

Invoke-Snake

